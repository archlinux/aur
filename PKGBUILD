# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=0.0.0.3
pkgrel=2
epoch=1
pkgdesc="A car driving and car combat mod for Quake III Arena/OpenArena"
arch=('any')
url="https://sourceforge.net/projects/q3rallysa/"
license=('GPL2')
depends=('quake3')
source=("https://downloads.sourceforge.net/project/q3rallysa/Pre-Alpha%20Releases/q3rally_v${pkgver//./}.zip")
sha256sums=('99b52baef5bd48c840eefbfddc17e8d7fba102689045feb8aaa92c6b57a8409d')

package() {
  cd "Q3Rally"

  # Remove unneeded files
  rm baseq3r/*.{dll,so}

  # Copy mod files
  mkdir -p "${pkgdir}/opt/quake3"
  cp -dR baseq3r "${pkgdir}/opt/quake3"
}

# vim:set ts=2 sw=2 et:
