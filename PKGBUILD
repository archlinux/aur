# Maintainer: Kenny Rasschaert <kenny@kennyrasschaert.com>
pkgname=pipecat-bin
pkgver=0.1
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
        https://raw.githubusercontent.com/lukasmartinelli/pipecat/v0.1/LICENSE)
md5sums=('8bd94e85687360abd58761ab43a25a61' SKIP)

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0755 pipecat_linux_${_arch} "${pkgdir}/usr/bin/pipecat"
}

# vim:set ts=2 sw=2 et:
