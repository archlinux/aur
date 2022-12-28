# Maintainer: Dpeta/Davepeta <jasprose@protonmail.com>
pkgname=pesterchum-bin
pkgver=v2.5.3
pkgrel=1
pkgdesc="Instant messaging client copying the look and feel of clients from Andrew Hussie's webcomic Homestuck."
arch=('x86_64')
url="https://github.com/Dpeta/pesterchum-alt-servers"
license=('GPL3')
depends=('glibc>=2.31' 'gstreamer' 'gst-plugins-base')
optdepends=('ca-certificates: up-to-date certificate validation'
            'ffmpeg: alternative Qt6 audio backend')
makedepends=('coreutils')
conflicts=('pesterchum-git')
source=("https://github.com/Dpeta/pesterchum-alt-servers/releases/download/v2.5.3/PesterchumAlt.-2.5.3-linux64-glibc2.36+.tar.xz"
        "pesterchum"
        "pesterchum.desktop")
sha256sums=('047d8bfa607ac1b6c95cbc42b7c1e28d071e09c10aef65a7ca08ef7f07af4d9a'
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
