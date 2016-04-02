# Maintainer: Panos Pitelos <pitepana@gmail.com>
 
pkgname=vamox-mate
pkgver=201
pkgrel=0
pkgdesc="Vamox MATE icon theme."
arch=('any')
url="https://vamox.blogspot.com"
license=('CC BY-SA 3.0')
options=(!strip)
source=(http://www.mediafire.com/download/ndcdqo993rf9ng5/$pkgname-$pkgver.tar.gz)
sha256sums=('d3f501c41102dbed193f06b6ad1b61de52f2f34fd6519ef0509b60168a090fc5')
 
package() {
        cd "${srcdir}"
        mv "${pkgname}-${pkgver}" "${pkgname}"
        
        #clean package
        pushd "${srcdir}/${pkgname}"
                rm "index (copia).theme" ".icon-theme.cache"
                install -Dm644 "VAMOX_readme.txt" "$pkgdir"/usr/share/doc/$pkgname/README.txt
                rm "VAMOX_readme.txt"
        popd
 
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${pkgname}" "${pkgdir}/usr/share/icons"
}
