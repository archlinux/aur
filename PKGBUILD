# Original author: Thomas Sowell <tom@fancydriving.org>
# Maintained by: Semyon Bochkaryov <squizduos@gmail.com>

pkgname=libgestures-bin
pkgdesc="Chromium OS gestures library (binary version)"
pkgver=2.1.14
pkgrel=2
arch=("i686" "x86_64")
url="https://github.com/hugegreenbug/libgestures"
license=('custom:chromiumos')
depends=('jsoncpp')
replaces=('libgestures')

_pkgver=2.1.14-1
_ppa_url="https://launchpad.net/~eugenesan/+archive/ubuntu/ppa"
_ppa_ver="ubuntu2~eugenesan~xenial3"


# Source files
source_i686=(
    "libgestures_${_pkgver}_${arch}.deb::${_ppa_url}/+build/9682492/+files/libgestures_2.1.14-1${_ppa_ver}_i386.deb"
    "libgestures-dev_${_pkgver}_${arch}.deb::${_ppa_url}/+build/9682492/+files/libgestures-dev_2.1.14-1${_ppa_ver}_i386.deb")

source_x86_64=(
    "libgestures_${_pkgver}_${arch}.deb::${_ppa_url}/+build/9682491/+files/libgestures_2.1.14-1${_ppa_ver}_amd64.deb"
    "libgestures-dev_${_pkgver}_${arch}.deb::${_ppa_url}/+build/9682491/+files/libgestures-dev_2.1.14-1${_ppa_ver}_amd64.deb"
)
noextract=(
    "libgestures_${_pkgver}_${arch}.deb"
    "libgestures-dev_${_pkgver}_${arch}.deb"
)
md5sums_i686=(
    '7afb68a9aac5328692190ef6ff04ac0a'
    'b995c86f55349f97e61cfd26420524ec'
)
md5sums_x86_64=(
    '7afb68a9aac5328692190ef6ff04ac0a'
    '7c19215c2440d814f66bfc707c396a48'
)

build() {
    ar x "${srcdir}/libgestures_${_pkgver}_${arch}.deb"
    tar xf "${srcdir}/data.tar.xz"
    ar x "${srcdir}/libgestures-dev_${_pkgver}_${arch}.deb" 
    tar xf "${srcdir}/data.tar.xz"
}

package() {
    msg2 "Install package resources..."
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
