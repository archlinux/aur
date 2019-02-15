
pkgname=movim-desktop
pkgver=0.13.90
pkgrel=0
pkgdesc='Movim is a decentralized social network'
arch=('x86_64')
url='https://movim.eu/'
license=('Copyright (c) 2013-2018 GitHub Inc.')
options=('!strip')
provides=($pkgname)

source=("https://dosowisko.net/movim/movim-desktop_0.13.90_amd64.deb" "https://dosowisko.net/movim/movim-desktop_0.13.90_amd64.deb.sig")

prepare() {
mkdir -p data
cd data
tar -xf ../data.tar.gz
}

package() {
        cp -dr --no-preserve=ownership ./data/{opt,usr} "${pkgdir}"/
        
	mkdir -p ${pkgdir}/usr/bin
	ln -s ${pkgdir}/opt/movim/movim ${pkgdir}/usr/bin/movim-desktop 2>/dev/null
        chmod +x ${pkgdir}/opt/movim/movim
}

sha512sums=("84ff5d1a6a15a8b5c536354943b31019042df60322705b69ace63fe908612673e03a6ab022860d04ec25c5d75214b3c6745c41179c35fb265c9ff56d6e8222ab"
"57e949d08687c5a2b1e316e16ffd6a776c744cc7b3fcad400268da6de4f76b249186070aec5ce79241be934470fd0d84bc9c666c959e56e0d623c3ed961ee043")
validpgpkeys=('22DD9FAE006A11435836617CE8F235CF3BDBC3FF')
