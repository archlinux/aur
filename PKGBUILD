# Maintainer: Amin Vakil <info at aminvakil dot com>

_pkgname=nagstamon
pkgname=$_pkgname-stable
pkgver=3.4.1
pkgrel=1
pkgdesc="Status monitor for Nagios, Icinga, Zabbix and more"
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('MIT')
depends=('python' 'python-keyring' 'python-beautifulsoup4' 'python-requests-kerberos')

source=(https://nagstamon.ifw-dresden.de/files/stable/nagstamon_${pkgver}_all.deb)

sha256sums=('2197ef8e4fb881fa36e6df8969b32b52450370aa5f47dc39c4373428ce29837b')

package() {
    cd ${srcdir}
    tar xf ${srcdir}/data.tar.xz
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/usr/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    mkdir -p ${pkgdir}/usr/lib/python3.8/site-packages/
    cp -dpr --no-preserve=ownership ${srcdir}/usr/lib/python3/dist-packages/Nagstamon/ ${pkgdir}/usr/lib/python3.8/site-packages/
    cp -dpr --no-preserve=ownership ${srcdir}/usr/share/ ${pkgdir}/usr/share/
}
