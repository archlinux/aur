# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>

pkgname=assinador-serpro
pkgver=2.7.1
pkgrel=1
pkgdesc='Assinador SERPRO'
arch=('x86_64')
url='https://www.assinadorserpro.estaleiro.serpro.gov.br/'
# pkgveri686=2.7.0

# source=("https://assinadorserpro.estaleiro.serpro.gov.br/repository/AssinadorSERPROpublic.asc")
# source_i686=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/assinador-serpro-i386_${pkgveri686}_i386.deb")
source_x86_64=("https://www.assinadorserpro.estaleiro.serpro.gov.br/repository/stable/assinador-serpro_${pkgver}_amd64.deb")
# sha256sums_i686=('7ec54364cd5ad1887dad9702ef1de663d3beac3d4ddcac5adb38fc32c8921683')
sha256sums_x86_64=('ea45748f97f383fd54ae3e24fd3c526d0ba186ea623c94c0d5cb5d1b19798683')

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
