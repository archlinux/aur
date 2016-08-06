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
sha512sums=('b5cc9f364bf8c89e477344f0d4e192f16c35510957d7470eb2e8c30b6df0568465b4807fb983f2dc5c3d7e76ccdd31e7a2c361b6af2571499457cb9c052d3421')

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
