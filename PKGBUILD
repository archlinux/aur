# Maintainer: Neko_Rikka <address at domain dot tld>

pkgname=python-pyfmodex
pkgver=0.7.2
pkgrel=1
pkgdesc="Python bindings to the Fmod Ex library."
arch=(any)
url="https://www.github.com/tyrylu/pyfmodex"
license=(MIT)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="pyfmodex" pyfmodex==$pkgver
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/pyfmodex/* $pkgdir/"$sitepackages"
}