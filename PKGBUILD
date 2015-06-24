# Maintainer: zoe <chp321@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kmidimon-bin
_pkgname=kmidimon
pkgver=0.7.5
pkgrel=1
pkgdesc="A MIDI monitor for Linux using ALSA sequencer"
arch=('i686' 'x86_64')
url="http://kmidimon.sourceforge.net/"
license=('GPL')
depends=('kdelibs' 'drumstick')
conflicts=('kmidimon')

if [[ `uname -m` = 'x86_64' ]]; then
        _arch='amd64'
        source=('http://mirrors.kernel.org/ubuntu/pool/universe/k/kmidimon/kmidimon_0.7.5-1_amd64.deb')
        md5sums=('e365f3924db9d1558f66c0ddd76c4866')
elif [[ `uname -m` = 'i686' ]]; then
        _arch='i386'
        source=('http://mirrors.kernel.org/ubuntu/pool/universe/k/kmidimon/kmidimon_0.7.5-1_i386.deb')
        md5sums=('e8d76889c0f17c2dee094933feb39222')
fi

package() {
    cd $srcdir

    bsdtar xf "${_pkgname}_${pkgver}-${pkgrel}_${_arch}.deb" || return 1
    bsdtar xf data.tar.gz -C $pkgdir || return 1
}
