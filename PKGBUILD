# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: tee <teeaur at duck dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=5.0.0
pkgrel=1
#pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
pkgdesc="Open-source, local-first workspace for notes, projects, and meetings"
#url="https://github.com/Daniele-rolli/Beaver-Notes"
url="https://github.com/Beaver-Notes/Beaver-Notes"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/v$pkgver/LICENSE")
source_aarch64=("$url/releases/download/v$pkgver/Beaver-notes-$pkgver-aarch64.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/Beaver-notes-$pkgver-x86_64.tar.gz")
sha256sums=('593ed481f41652b46705e544226e0b58ffc046138f6a34777a0092e8d1f54b1d')
sha256sums_x86_64=('4ad18e487d3a87a93a04ee9627bb8aac21733a12d96ca7230f888032a077501b')
sha256sums_aarch64=('0d728a083c44dabb86ed9c53f783a63ee25f90abdf0461457987a129f15605ac')
noextract=("Beaver-notes-$pkgver-aarch64.tar.gz" "Beaver-notes-$pkgver-x86_64.tar.gz")

prepare() {
  :
}

package() {
  cd "$pkgdir"
  install -d usr
  tar -C usr -axf "$srcdir/Beaver-notes-$pkgver-$CARCH.tar.gz"
  sed -i -E "s|StartupWMClass=beaver-notes|StartupWMClass=Beaver Notes|g" "usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir"/LICENSE -t "usr/share/licenses/$_pkgname/"
}
