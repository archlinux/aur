# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='openscad-thread-profile-git'
_gitname='IoP-satellite'
pkgver=r19.a78b36f
pkgrel=1
pkgdesc='thread_profile.scad for threads in OpenSCAD. Part of the IoP-satellite repo'
url='https://github.com/MisterHW/IoP-satellite'
license=(
 'unknown'
)
source=(
 "git+https://github.com/MisterHW/IoP-satellite.git"
)
sha512sums=(
 'SKIP'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openscad'
 'openscad-scad-utils-git'
 'openscad-list-compr-demos-git'
)

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
 # nop
 cat /dev/null
}

package() {
 # ensure libraries folder exists
 mkdir -p $pkgdir/usr/share/openscad/libraries/
 cd "$_gitname"
 install -Dm644 "OpenSCAD bottle threads/thread_profile.scad" $pkgdir/usr/share/openscad/libraries/
}
