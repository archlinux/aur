# Maintainer: Brian Allred brian.d.allred<AT>gmail.com

pkgname=p-insurgence-bin
pkgrel=1
pkgver=1.2.7
pkgdesc='Pokemon Insurgence is a fan game for the Pokemon series based in a new region with new mechanics'
arch=('any')
url='https://p-insurgence.com'
license=('none')
depends=('wine' 'sh')
options=('!strip')
source=("https://p-insurgence.com/releases/${pkgver}/Pokemon%20Insurgence%20${pkgver}%20Core.zip"
		"Insurgence.desktop"
        "p-insurgence.sh")
sha256sums=('1c7144958d92897e61a137b441029bd65dbfa44e705e977b85c1ac795956c2e3'
            '4888262200800ac9beadbfdd99da793f1163d79fe514d4ab30fb61f3ac412946'
            'e1745c4e01e95e7afcc7112329c40d3002dbdb41b054e9854a78551ed863b917')

package() {
    # Move to directory
    mkdir -p "${pkgdir}/opt"
    mv "Pokemon Insurgence ${pkgver} Core" "${pkgdir}/opt/p-insurgence"
    chmod +x p-insurgence.sh
    cp p-insurgence.sh "${pkgdir}/opt/p-insurgence/p-insurgence.sh"
	
	# Link
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
	ln -s "/opt/p-insurgence/p-insurgence.sh" "${pkgdir}/usr/bin/p-insurgence"
	cp Insurgence.desktop "${pkgdir}/usr/share/applications/"
}
