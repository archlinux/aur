pkgname=python-home-assistant-frontend
pkgver=20231208.2
pkgrel=1
pkgdesc="The Home Assistant frontend"
arch=(any)
url="https://github.com/home-assistant/frontend"
license=(Apache-2.0)
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --target="home-assistant-frontend" home-assistant-frontend==${pkgver}
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/home-assistant-frontend/* $pkgdir/"$sitepackages"
}
