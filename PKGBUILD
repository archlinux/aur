# Maintainer: klardosh <josh@klar.sh>
pkgname=helm-vst-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Helm - VST and LV2 versions'
arch=('x86_64')
url='https://tytel.org/helm'
license=('GPL3')
groups=('vst-plugins')
provides=('helm')
conflicts=('helm' 'helm-git')
options=('!strip' '!libtool' '!emptydirs')
source=("https://tytel.org/static/dist/helm_${pkgver}_amd64_r.deb")
sha256sums=('aedf8b676657f72782513e5ad5f9c61a6bc21fe9357b23052928adafa8215eca')

package() {
	ar x "helm_${pkgver}_amd64_r.deb"
	rm -f data.tar
	unxz data.tar.xz
	tar xf data.tar
	cp -r usr "${pkgdir}/"
	mv "${pkgdir}/usr/lib/lxvst" "${pkgdir}/usr/lib/vst"
}
