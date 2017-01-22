# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=pydio-booster
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="Pydio Booster is a unique tool developed to easily boost your Pydio installation performance"
arch=('i686' 'x86_64')
url="https://pydio.com/"
license=('AGPL3')
provides=('pydio-booster')
conflicts=('pydio-booster-bin')
#depends=('pydio')
options=('!strip' '!emptydirs')
backup=('etc/pydio/pydio.conf')

source_i686=("$pkgname-$pkgver::https://download.pydio.com/pub/booster/release/${pkgver}/linux_386/pydio"
             "pydio-booster.service"
             "pydio.conf"
             "pydiocaddy.conf")
source_x86_64=("$pkgname-$pkgver::https://download.pydio.com/pub/booster/release/${pkgver}/linux_amd64/pydio"
               "pydio-booster.service"
               "pydio.conf"
               "pydiocaddy.conf")

sha512sums_i686=('df0c8b2801f142ddb7f629b6a6cf52470a5221b18a383c0f946268bed5df162f42130b2943bd6e9e2559d7c841a7675b530bc32a524694f81c97e2f57f331369'
                 'bb768568b130c362447e84bd5f8c1668239ad42694410a8a5090fd19d049729d4f5a442e2b853ec65a639f429016f3debdc0e6e8b1871b338db98dedc7b16d0e'
                 '4f135c0992e4e902f71381bc81b8f4fc959493835a98c098271280b6db95d83018aa3663003844deff8684d91ebd483b4865590cf476d9e6ff95998d77e8d5af'
                 '049b1a7eba38cc2b0cf2f37da4f677a174156f9ef3d20d68820006c7eeb2c4f8964875378fe0394d69604a153f4706a04dded858282ed58b1ef7a305de4c176f')
sha512sums_x86_64=('fc22131c957eb4b3fae6ca2b675a734ab37d89d3706cd6fb86315ebcdc0381abf963a8198897c323e8b2238a39b744c6e8c050d960d59bd576661c8b816a082c'
                   'bb768568b130c362447e84bd5f8c1668239ad42694410a8a5090fd19d049729d4f5a442e2b853ec65a639f429016f3debdc0e6e8b1871b338db98dedc7b16d0e'
                   '4f135c0992e4e902f71381bc81b8f4fc959493835a98c098271280b6db95d83018aa3663003844deff8684d91ebd483b4865590cf476d9e6ff95998d77e8d5af'
                   '049b1a7eba38cc2b0cf2f37da4f677a174156f9ef3d20d68820006c7eeb2c4f8964875378fe0394d69604a153f4706a04dded858282ed58b1ef7a305de4c176f')

package() {
  msg2 "Package"
  install -Dm0755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/pydio/$pkgname"
	
  install -Dm644 "$srcdir/pydio.conf" "$pkgdir/etc/pydio/pydio.conf"
  install -Dm644 "$srcdir/pydiocaddy.conf" "$pkgdir/etc/pydio/pydiocaddy.conf"

  install -Dm0644 "$srcdir/pydio-booster.service" "$pkgdir/usr/lib/systemd/system/pydio-booster.service"
}
