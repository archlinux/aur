# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=rffmpeg-git
pkgver=r231.a242218
pkgrel=1
pkgdesc="Remote SSH FFmpeg wrapper tool"
arch=('any')
url="https://github.com/joshuaboniface/rffmpeg"
license=('GPLv3')
groups=()
depends=('python' 'python-yaml')
makedepends=('git')
optdepends=()
provides=('ffmpeg-wrapper')
source=("rffmpeg::git+https://github.com/joshuaboniface/rffmpeg")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/rffmpeg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -m 755 -p "$pkgdir/etc/rffmpeg"
    install -m 644 "$srcdir/rffmpeg/rffmpeg.yml.sample" "$pkgdir/etc/rffmpeg/"
    mkdir -m 755 -p "$pkgdir/usr/bin"
    install -m 755 "$srcdir/rffmpeg/rffmpeg" "$pkgdir/usr/bin/rffmpeg"
}
