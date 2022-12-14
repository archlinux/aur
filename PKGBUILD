# Maintainer: Dpeta/Davepeta <jasprose@protonmail.com>
pkgname=pesterchum-bin
pkgver=v2.5.2
pkgrel=1
pkgdesc="Instant messaging client copying the look and feel of clients from Andrew Hussie's webcomic Homestuck."
arch=('x86_64')
url="https://github.com/Dpeta/pesterchum-alt-servers"
license=('GPL3')
depends=('glibc>=2.31' 'gstreamer' 'gst-plugins-base')
optdepends=('ca-certificates: up-to-date certificate validation'
            'ffmpeg: alternative Qt6 audio backend')
makedepends=('coreutils')
source=("https://github.com/Dpeta/pesterchum-alt-servers/releases/download/v2.5.2/PesterchumAlt.-2.5.2-linux64-glibc2.31+.tar.xz"
        "pesterchum"
        "pesterchum.desktop")
sha256sums=('49133c4c8c2bcf8b7dbff58c5024dc13be10568281300312560736713767239a'
            'd33079b23dc67174149ae4514e4181c242abc520853452ab5eee367e55619813'
            'e77cd8faeee2dca1fed41e559bdddea473dfc488cd99783b9dc811285b1c991d')

package() {
  # Extract Pesterchum
  mkdir -p "$pkgdir/opt/"
  mv "$srcdir/Pesterchum" "$pkgdir/opt/pesterchum"
  
  # Install sh script for running from the command-line
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 "pesterchum" "$pkgdir/usr/bin/"
  
  # Install desktop entry
  mkdir -p "$pkgdir/usr/share/applications/"
  install "pesterchum.desktop" "$pkgdir/usr/share/applications/"
}
