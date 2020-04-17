# Maintainer: phiresky <phireskyde+aur@gmail.com>

pkgname=ripgrep-all-bin
pkgver=0.9.5
pkgrel=1
arch=(x86_64)
pkgdesc="rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc."
url="https://github.com/phiresky/ripgrep-all"
license=('AGPL3')
depends=('ripgrep' 'pandoc' 'poppler' 'ffmpeg' 'imagemagick')
provides=('ripgrep-all')
conflicts=("rga-git" "rga-bin" "ripgrep-all" "ripgrep-all-git")
archivename="ripgrep_all-v${pkgver}-${arch}-unknown-linux-musl"
source=("https://github.com/phiresky/ripgrep-all/releases/download/v${pkgver}/${archivename}.tar.gz")
sha1sums=('61b0096e07ef1f6b5ec162bb560dbce8841c46db')

package() {
  cd "$srcdir/$archivename"
  mkdir -p "$pkgdir/usr/bin"
  cp rga rga-preproc "$pkgdir/usr/bin"
}
