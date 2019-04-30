# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=dict-moby-thesaurus
pkgver=1.0
pkgrel=1
pkgdesc="Largest and most comprehensive thesaurus for dictd et al."
arch=('any')
url='https://www.gutenberg.org/ebooks/3202'
license=('custom: Public Domain')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
install=${pkgname}.install
source=("https://github.com/ferdnyc/dictd-dicts/raw/master/moby-thesaurus.dict.dz"
        "https://github.com/ferdnyc/dictd-dicts/raw/master/moby-thesaurus.index")
sha512sums=('8e57d2123a7f9104c98f2cfca68b8c2be1cbf024fc2717400a560d4da9bafeee506da63921999f355282c4365a197fb08870fe1c838440fefabf7758b27b1f82'
            'cf72738857e8bc404d4e5ee750ce17fa2b4db752b695aa3c323d854c415787f0d5185e604feba2c8d5ee200e4994c8310a0c350380220185d731a3705d04b2d5')

package() {
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" moby-thesaurus.{dict.dz,index}
}
