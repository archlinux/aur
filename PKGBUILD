# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors

pkgname=eric
pkgver=20.9
pkgrel=2
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://eric-ide.python-projects.org/"
license=('GPL3')
depends=('python-qscintilla-qt5' 'python-pyqtwebengine' 'python-pyqtchart' 'qt5-svg')
conflicts=(eric-common)
replaces=(eric-common)
source=("https://downloads.sourceforge.net/eric-ide/eric6-$pkgver.tar.gz")
sha512sums=('ffdab3b51f0c782d79d99387d6e54bc4b5b05a40a61972731516efedbb276ea1bb9632ffe65fced25642c900a77d9240aed8d31cb3fe238292278a2fd9d53e73')
changelog=ChangeLog

package_eric() {
  cd eric6-$pkgver
  python install.py -c -b "/usr/bin" -i "${pkgdir}"

  # fix paths in desktop files
  find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

# vim:set ts=2 sw=2 et:
