# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=quik
pkgver=10.1.2
pkgrel=1
pkgdesc="Trading terminal in Wine"
url="https://arqatech.com/ru/"
arch=('x86_64')
depends=('wine' 'unzip')

source=(
"ftp://ftp.quik.ru/public/updates/10.1.2/quik_${pkgver}_upd.zip"
"ftp://ftp.quik.ru/public/updates/9.7/StratVolat_3.0.3_upd.zip"
"ftp://ftp.quik.ru/public/updates/keygen_1.3.0_upd.zip"
'quik'
'quik-keygen'
'qrypto.cfg'
'ip.cfg'
)
sha256sums=(
'8d34637175208a4ffb0506578e6e218a197cd9466d53f1073f6f1b79e73a2def'
'5b30484a29721a94ad46b939cc3241fb14fdff7ba5f5be7aae6b885ab1309a0e'
'bc66665d2209836abe51ae9258c289c0f682dba4ea5261f9319996a60a6a4ae7'
'133bcae46a8f0547603fb2f157b89bf4be59291bf9292695f723d7d5b1cf01dc'
'92563c563a9781592d1e119117e3b7a899addfabd733648986b97db999386821'
'd981ee4cc35d33a3b37c43fb7343bde5c24e15e003dbb67907b602d22f60a469'
'd7d917f720477acd54f35d2c832d9457862527fb91f71d62ead39fdc785b968c'
)

build() {
	mkdir -p "./usr/lib/quik"
	unzip "${srcdir}/quik_${pkgver}_upd.zip"   -d "./usr/lib/quik"
	unzip "${srcdir}/StratVolat_3.0.3_upd.zip" -d "./usr/lib/quik"
	cp {qrypto.cfg,ip.cfg} "./usr/lib/quik/"

	mkdir -p "./usr/lib/quik/keygen"
	unzip "${srcdir}/keygen_1.3.0_upd.zip" -d "./usr/lib/quik/keygen"

	mkdir -p "./usr/bin"
	cp {quik,quik-keygen} "./usr/bin/"
}

package() {
	cp -r "./usr" "${pkgdir}"
}
