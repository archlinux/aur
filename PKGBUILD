# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
pkgname=chaostictool
pkgver=2.1.0
pkgrel=1
pkgdesc='Terminal and desktop interfaces for authorized security testing'
arch=('any')
url='https://github.com/Chaos-Tic/Chaostic-Tool'
license=('GPL-3.0-or-later')
provides=("chaostictool-desktop=$pkgver")
conflicts=('chaostictool-desktop' 'chaostictool-cli')
replaces=('chaostictool-desktop' 'chaostictool-cli')
depends=('python>=3.11' 'python-rich>=13.7' 'python-prompt_toolkit>=3.0' 'ca-certificates' 'pyside6>=6.8' 'python-psutil' 'python-dnspython' 'python-py7zr' 'python-pyte' 'python-keyring')
makedepends=('cmake')
# pre_remove(): notify about the external tools recorded in the manifest.
install='chaostictool.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c998b72c5836ae54274b9312d48f4401a041d018f25b52b691b8676af335d5b3')
build() {
    cmake -S "Chaostic-Tool-$pkgver" -B build -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}

