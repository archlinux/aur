# Maintainer: Ewen Le Bihan <hey@ewen.works>
pkgname=wikitrad
pkgver=0.2.0
pkgrel=2
pkgdesc="A CLI to translate terms with wikipedia"
arch=(any)
url="https://github.com/ewen-lbh/wikitrad"
license=("GPL")
makedepends=("python" "python-pip")
conflicts=("wikitrad-git")
build() {
  pip install --no-deps --target="wikitrad" wikitrad==$pkgver
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p "$pkgdir"/"$sitepackages"
  cp -r "$srcdir"/wikitrad/* "$pkgdir"/"$sitepackages"
}
