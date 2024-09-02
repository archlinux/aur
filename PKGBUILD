# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Frederic Bezies <fredbezies at gmail.com>
# Contributor: goetzc
# Contributor: thetotalchaos

# Check for new release:
# curl -s https://flavio.tordini.org/finetune-ws/release.xml | tr -dc 0-9.

pkgname=finetune
pkgver=3.0
pkgrel=1
pkgdesc="Automatic music tagger"
arch=('x86_64')
url="https://flavio.tordini.org/finetune"
license=('LicenseRef-unknown')
depends=(
  'chromaprint'
  'hicolor-icon-theme'
  'qt6-base'
  'qt6-declarative'
  'taglib1'
)
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('3e35c8ed0741b142fedd579515af681957cce0425611712b255259e734f5afd5')

package() {
  bsdtar -xvf data.tar.zst -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
