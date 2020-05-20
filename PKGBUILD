# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=mkvdts2ac3
pkgver=1
pkgrel=1
pkgdesc='Bash script to convert DTS audio to AC3 within a matroska file.'
arch=('any')
url="https://github.com/JakeWharton/mkvdts2ac3"
license=('Apache-2.0')
depends=('mkvtoolnix-cli' 'ffmpeg' 'rsync')
source=('git+https://github.com/JakeWharton/mkvdts2ac3')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mkvdts2ac3"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cd "$srcdir/mkvdts2ac3"
  cp -r mkvdts2ac3.sh "$pkgdir/usr/bin/mkvdts2ac3"
  chmod +x ${pkgdir}/usr/bin/mkvdts2ac3
}
