# Contributor: cdfk <cdfk1981-at-gmail.com>
# Contributor: alcasa <alcasa.mz-at-gmail.com>

pkgname=brother-cups-wrapper-ac
pkgver=1.0.3
pkgrel=1
pkgdesc="This package provides all cups wrapper drivers for models HL-4040CN HL-4040CDN HL-4050CDN HL-4070CDW MFC-9440CN MFC-9450CDN MFC-9840CDW DCP-9040CN DCP-9042CDN DCP-9045CDN"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
depends=('brother-lpr-drivers-ac' 'brother-cups-wrapper-common')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  'a0516773ec558bd2e71112f8c8691a87')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  'bcaa22d78cb9ae9069ecb42df12ffaa3')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-1-0ubuntu1_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-1-0ubuntu1_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
