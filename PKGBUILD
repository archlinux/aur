# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='openscad-threadlib-git'
_gitname='threadlib'
pkgver=r82.950ee06
pkgrel=1
pkgdesc='Library containing standard threads for OpenSCAD (git version)'
url='https://github.com/adrianschlatter/threadlib'
license=(
 'BSD'
)
source=(
 "git+https://github.com/adrianschlatter/threadlib.git"
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
 'openscad-thread-profile-git'
)
provides=(
 'openscad-threadlib'
)
conflicts=(
 'openscad-threadlib'
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
 mkdir -p $pkgdir/usr/share/openscad/libraries/threadlib
 cd "$_gitname"
 install -Dm644 *.scad "$pkgdir/usr/share/openscad/libraries/threadlib"
 install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
