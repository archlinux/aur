# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=assinador-serpro
pkgname=serpro-signer
pkgver=3.1.0
pkgrel=1
pkgdesc='Assinador SERPRO'
arch=('x86_64')
url='https://www.assinadorserpro.estaleiro.serpro.gov.br/'
# pkgveri686=2.7.0
depends=('libappindicator-gtk3')
# source=("https://assinadorserpro.estaleiro.serpro.gov.br/repository/AssinadorSERPROpublic.asc")
# source_i686=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/assinador-serpro-i386_${pkgveri686}_i386.deb")
source_x86_64=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/${_pkgname}_${pkgver}_amd64.deb")
# sha256sums_i686=('7ec54364cd5ad1887dad9702ef1de663d3beac3d4ddcac5adb38fc32c8921683')
sha256sums_x86_64=('f09b2039ce1de06990d31a3f7b1e9c1263a690c5ed99088aeeebbdaa26b1f3bb')

prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	cp -dr --no-preserve=ownership ./data/{etc,opt,usr} "${pkgdir}"/
}
