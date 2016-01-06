# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=pipecat-bin
pkgver=0.2
pkgrel=1
pkgdesc="Connect UNIX pipes and message queues"
arch=('i686' 'x86_64')
provides=('pipecat')
url="https://github.com/lukasmartinelli/pipecat"
license=('MIT')
if [[ $CARCH =~ i[0-9]86 ]]; then _arch=386
elif [[ $CARCH == x86_64 ]]; then _arch=amd64
fi
source=(https://github.com/lukasmartinelli/pipecat/releases/download/v${pkgver}/pipecat_linux_${_arch}
        https://raw.githubusercontent.com/lukasmartinelli/pipecat/v${pkgver}/LICENSE)
sha1sums=('c6b3592c707d89b188dc01176dfa10f0f1ab5774'
          '22c0aa2b7651553ea85bdab73d8358df9cfe77f2')

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 pipecat_linux_${_arch} "${pkgdir}/usr/bin/pipecat"
}

# vim:set ts=2 sw=2 et:
