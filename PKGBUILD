pkgdesc='App Container Server'
pkgname=acserver
pkgver=0.0.0
pkgrel=1
url="https://github.com/appc/$pkgname"
source=("git+${url}.git")
makedepends=('git' 'go')
arch=('i686' 'x86_64')
md5sums=('SKIP')
license=('Apache')

# 1.
prepare() {
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$srcdir/$pkgname" # working repo location
    local target=$([[ $pkgver == "0.0.0" ]] && printf "master" || printf "v$version")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
    cp -f $base/build.sh $repo/build
    true
}

# 2.
build() {
    cd $pkgname
    pwd
    ./build
}

# 3.
check() {
    true
}

# 4.
package() {
    true
}
