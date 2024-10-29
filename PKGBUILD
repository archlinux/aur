# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='goto-ssh'
pkgver=1.2.0
pkgrel=1
pkgdesc='A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers.'
arch=('any')
license=('MIT')
url='https://github.com/grafviktor/goto'
source=("https://github.com/grafviktor/goto/releases/download/v${pkgver%b*}/goto-v${pkgver%b*}.zip"
        LICENSE)
b2sums=('03eeeda39ebb515a0f0b3a20d424f1d7e4ea12943e2bf9df85ba700728194214f83363b543d93fce4d395e08223296914e732107c402832a7a03dbfe5770f1e4'
        'cc4224fc1a21f3266ad283c5b6b436bc4d65ef8138b38d1fc727da0429478e244b17e0e0cc9081108c04eea077e4023a023decb735bdc8db63b05fc0e4f0ae72')
provides=('goto-ssh' 'gg-ssh')

package() {
    install -Dm755 "${srcdir}"/goto-v${pkgver%b*}/gg-lin "${pkgdir}"/usr/bin/${pkgname}
    ln -s /usr/bin/${pkgname} "${pkgdir}"/usr/bin/${provides[1]}

    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
