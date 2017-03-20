# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
pkgver=0.2.2.r571
_ver=${pkgver%%.r*}
pkgrel=1
pkgdesc='An IP-Transparent Tor Hidden Service Connector'
arch=('i686' 'x86_64')
url='https://www.onioncat.org/'
license=('GPL3')
depends=('tor' 'net-tools')
source=("https://www.cypherpunk.at/ocat/download/Source/${_ver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('98678E06063007E4A1F0B9C59BD601668E24F29D') # Bernhard R. Fischer (Eagle) <bf@abenteuerland.at>

sha512sums=('afb30ef928c530da8140bd92cd43bda3605a448f1b5d405745dfcc2ff5a37501a04deb6df53a706724c31a260439711c719b7ba740a0863e7e27396d7fffab3e'
            '9598e83e619d0db631b2323c4db3019d58aaa6b33ec58e58185d4d05a855d636ad0d4313d07513b01fd84fe284f619d1aa8ab1577faa1d64f316b44396e3df1b')
whirlpoolsums=('fd7b9bc300c69d318eb67f5e7480f1cf348af17fc353fcfad5e234537779553b557d1be387c8cfc412c3ec4aea422367cdf7e26a2165141cc9e400f8e583af4d'
               '943db147553b3ec95bf55f89f3855c6e05e916e28f7903a61c8dae1ab1e79cfab3df61c6a1402325681dbd2b88f810c22643c8939864cf87252e019212df7540')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
