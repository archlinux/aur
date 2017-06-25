# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=gixy
pkgver=0.1.5
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
checkdepends=('python-nose')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('08746568d2e7bd03197ac3e3beb438ec999f32a32a0e9ecfe6aa8e9a9ce4a30f00f1aec0b8b9a4ab7bac1f5c22df3348bc3acbac391dd54c729140e87fe042bb')

check() {
  cd gixy-$pkgver
  nosetests
}

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
