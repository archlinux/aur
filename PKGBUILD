# Contributor: Vithon <ratm@archlinux.us>
# Maintainer: Zoe <chp321@gmail.com>
pkgname=quelcom
pkgver=0.4.0_13
_pkgver=0.4.0
pkgrel=15
pkgdesc="Quelcom provides assorted tools to perform simple editing operations on MP3 and WAV audio files. These include fading, check-and-clean, informational extraction and lossless cutting and joining without reencoding."
license=('GPL')
url="http://packages.ubuntu.com/trusty/sound/quelcom"
arch=('i686' 'x86_64')

if [[ $CARCH = 'x86_64' ]]; then _arch='amd64'
elif [[ $CARCH = 'i686' ]]; then _arch='i386'
fi

source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/q/${pkgname}/${pkgname}_${_pkgver}-13_${_arch}.deb")
md5sums_x86_64=('a29966b510401c2504f23ba27e2ae2db')
source_i686=("http://mirrors.kernel.org/ubuntu/pool/universe/q/${pkgname}/${pkgname}_${_pkgver}-13_${_arch}.deb")
md5sums_i686=('de6890247ea09b7f262f9ded563e7935')

package() {
    cd $srcdir
    bsdtar -xf "${pkgname}_${_pkgver}-13_${_arch}.deb" || return 1
    bsdtar -xf data.tar.gz -C $pkgdir || return 1
}
