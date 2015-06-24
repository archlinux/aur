# Contributor: Vithon <ratm@archlinux.us>
# Maintainer: Zoe <chp321@gmail.com>
pkgname=quelcom
pkgver=0.4.0-13
pkgrel=14
pkgdesc="Quelcom provides assorted tools to perform simple editing operations on MP3 and WAV audio files. These include fading, check-and-clean, informational extraction and lossless cutting and joining without reencoding."
license=('GPL')
url="http://packages.ubuntu.com/trusty/sound/quelcom"
arch=('i686' 'x86_64')
if [[ `uname -m` = 'x86_64' ]]; then
        _arch='amd64'
        source=('http://mirrors.kernel.org/ubuntu/pool/universe/q/quelcom/quelcom_0.4.0-13_amd64.deb')
        md5sums=('a29966b510401c2504f23ba27e2ae2db')
elif [[ `uname -m` = 'i686' ]]; then
        _arch='i386'
        source=('http://mirrors.kernel.org/ubuntu/pool/universe/q/quelcom/quelcom_0.4.0-13_i386.deb')
        md5sums=('de6890247ea09b7f262f9ded563e7935')
fi


package() {
    cd $srcdir

    bsdtar xf "${pkgname}_${pkgver}_${_arch}.deb" || return 1
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}
