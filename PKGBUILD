# Maintainer: matoro <matoro@airmail.cc>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Vivien Didelot <vivien+aur@didelot.org>
# Contributor: hashworks <mail@hashworks.net>

pkgname=i3blocks-contrib-git
pkgver=v1.4.0.r157.21708ed
pkgrel=1
pkgdesc='Official repository of community contributed blocklets'
arch=('x86_64')
groups=('i3')
url="https://github.com/vivien/i3blocks-contrib"
license=('GPL3')
makedepends=('git')
depends=('glibc')
source=("git+https://github.com/vivien/i3blocks-contrib")
sha512sums=('SKIP')
backup=('etc/i3blocks.conf')

pkgver() {
    cd "${srcdir}"/i3blocks-contrib
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package () {
  cd "${srcdir}"/i3blocks-contrib
  mkdir -p "${pkgdir}"/usr/lib/i3blocks
  find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -exec cp -r {} "${pkgdir}"/usr/lib/i3blocks/ \;
}
