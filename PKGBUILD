# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Frederic Bezies <fredbezies at gmail.com>
# Contributor: goetzc
# Contributor: thetotalchaos

# Check for new release:
# curl -s https://flavio.tordini.org/finetune-ws/release.xml | tr -dc 0-9.

pkgname=finetune
pkgver=2.2.1
pkgrel=3
pkgdesc="Automatic music tagger"
arch=('x86_64')
url="https://flavio.tordini.org/finetune"
license=('unknown')
depends=('chromaprint' 'hicolor-icon-theme' 'qt5-declarative' 'taglib')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('253c5ab3db74f0c0e9286f4d05c271e9995f1cdd6f28132b015318f893de20c9')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
