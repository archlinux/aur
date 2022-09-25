# Maintainer: EndeavourOS-Team <info@endeavouros.com>
# Maintainer: TNE <tne@garudalinux.org>
# Mainteiner: Mikhail Velichko <efklid@gmail.com>

pkgname=reflector-simple
pkgdesc="Simple GUI wrapper for 'reflector'."
pkgver=3.3
pkgrel=1
arch=('any')
license=('GPL')
depends=(
   bash yad reflector whois geoip bind
)
optdepends=(
  'reflector-bash-completion: useful for plain reflector usage'
)
backup=(
  etc/$pkgname.conf
  etc/${pkgname}-tool.conf
)

#url=https://github.com/endeavouros-team/PKGBUILDS
url=https://github.com/endeavouros-team/PKGBUILDS/tree/master/$pkgname


source=(
  $pkgname
  $pkgname.desktop
  $pkgname.conf
  ${pkgname}-tool.conf
  mirrorlist-rank-info
  latest-arch-mirrorlist
  $pkgname.svg
  show-location-info
)
sha512sums=('f3cc0f7b34ae1538e9201287693239912798fa220a4b1ca357c9d0dea1a2cb0cd88e7ee82128ecd91141c019dd27cf8700f03ef1ada6efe940361543ef6be3c5'
            'ac9d9313d85e3f90b7a5b1e9daa4bb16bfac4329336bc4a1e3924633a3c249c63c28603f35ede7f030a09cf52591d23fb2b0bdde7f2dbb4292855897220e54c2'
            'aa149c8fc273e6a9fb5ddc38bde8a37b8fb095ec8877a324b957be57e156ef583adbed5988f0184ef06d5d09ec13e01e4a58b81fffef5d6d316405a3881895c3'
            '8b101caac9f38238d30f293176a09f1bb483ec1cdc474ef126ec087a8b548b50eee5c35617f0616dd1618e4dce72e14b70270f47658577e20e04a133405510aa'
            'c56090338b01f6eb251e3250d69d32c2b96c8393ebe921896de3ad1bd5c622c01ae637a09c6d0d0aa40e71d55be608a8d77066be05929d586723e79e0f24002c'
            '1b48d63ef98e51cd56ad3ffda5f27228eb0de5e5ddfdd15b58980b588748cbdd11bf6419e59188defccbdef1c33ab1aaaea8d4af327df470e5c641686912c413'
            '1d904cf0b7ae64052f70a77ff3a102e8741b54cd4bf81fce25eef2c3d475291aa79a3c8c39d63b13e28753d33ed4b0106bd896cd50952c26a7c79cbf5795157f'
            'be1a4eae09bde1666ad1cef7acfa310edf9dd2a4659fc7bde6da115b8f89ab0020993ea315025fae7b3ce34284d40eaae6378242ef46dda9aec4997ec2339334'
            )

package() {
  cd $srcdir

  sed -i $pkgname -e "s|local VERSION_INFO=.*$|local VERSION_INFO=${pkgver}-$pkgrel|"

  install -d $pkgdir/usr/bin
  install -d $pkgdir/etc
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/usr/share/pixmaps/

  install -Dm755 $pkgname                     $pkgdir/usr/bin/$pkgname
  install -Dm755 latest-arch-mirrorlist       $pkgdir/usr/bin/latest-arch-mirrorlist
  install -Dm755 mirrorlist-rank-info         $pkgdir/usr/bin/mirrorlist-rank-info
  install -Dm755 show-location-info           $pkgdir/usr/bin/show-location-info
  install -Dm644 $pkgname.svg                 $pkgdir/usr/share/pixmaps/$pkgname.svg
  
  install -Dm644 $pkgname.conf           $pkgdir/etc/$pkgname.conf
  install -Dm644 ${pkgname}-tool.conf    $pkgdir/etc/${pkgname}-tool.conf
  install -Dm644 $pkgname.desktop        $pkgdir/usr/share/applications/$pkgname.desktop
}
