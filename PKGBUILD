# Maintainer: Erik Westrup <erik.westrup@gmail.com>
# Reference on git checkout: https://man.archlinux.org/man/PKGBUILD.5#USING_VCS_SOURCES

pkgname=zscreen
pkgver=20160510  # date of latest commit
pkgrel=1
pkgdesc="Scrot and imgur/s3 upload zenity gui"
arch=('any')
url="https://github.com/ChrisZeta/Scrot-and-imgur-zenity-GUI"
_git_commit='e9d15e606a0d358f002d0ec45324069c5cff3c68'
source=("zscreen::git+https://github.com/ChrisZeta/Scrot-and-imgur-zenity-GUI#commit=${_git_commit}")
license=()
makedepends=('git')
md5sums=('SKIP')
depends=('bash' 'curl' 'scrot' 's3cmd' 'zenity')
provides=('zscreen' 'zimgur' 'zs3upload')


package() {
  cd "$srcdir/${pkgname}/src"

  install -Dm755 zimgur.sh "${pkgdir}/usr/bin/zimgur"
  install -Dm755 zscreen.sh "${pkgdir}/usr/bin/zscreen"
  install -Dm755 zs3upload.sh "${pkgdir}/usr/bin/zs3upload"
 }



# vim:set ts=2 sw=2 et:
