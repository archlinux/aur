# Maintainer: Claudio Maggioni <maggioniclaudio1999 at gmail dot com>
pkgname=astleyrm
pkgver=1
pkgrel=1
pkgdesc="Rickroll whoever tries to desert (rm -rf) your *NIX system, even root."
arch=('any')
url="https://praticamentetilde.github.io/linux/2016/07/28/how-to-rickroll-people-launching-rm-rf-on-your-system.html"
license=('custom:unlicense')
depends=('coreutils')
makedepends=('git')
optdepends=('xdg-utils: to open with xdg-open links in rickroll()')

_repo=astley-rm
_branch=master

source=("$_repo-$_branch.zip::https://github.com/praticamentetilde/$_repo/archive/$_branch.zip")
sha512sums=('1af724a01878f1a5484c0a38e7990d66aac88249a13cc4ea04422d04d4d6f35fea6fb29eb0b9fbc63c7ec03672ffdd5dc92397c23f49de164a4cf5d3d0eac29a')

package() {
  cd "$srcdir/$_repo-$_branch"
  echo "Placing /usr/bin/astley-rm script..."
  install -D -m755 astley-rm.sh "$pkgdir"/usr/bin/astley-rm
  echo "Placing /usr/bin/astley-rm-config script..."
  install -D -m755 astley-rm-config.sh "$pkgdir"/usr/bin/astley-rm-config
  echo "Installing license..."
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Done."
}
