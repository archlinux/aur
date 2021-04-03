# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitname=arbie
_gitbranch=main
_gitauthor=lbcnz
pkgname=arbie-git
pkgver=r52.6c50b76
pkgrel=1
pkgdesc="Automatic Robust Backup, an archiving and synchronization tool."
arch=('any')
license=('MIT')
url="https://github.com/${_gitauthor}/${_gitname}"
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
install="${_gitname}.install"
sha512sums=('SKIP')
depends=('bash' 'borg' 'gocryptfs' 'rclone' 'rsync' 'systemd' 'git')
optdepends=('pass: standard password manager' 'gopass: improved password manager')
conflicts=("${_gitname}")
provides=("${_gitname}")

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_gitname}"
}
