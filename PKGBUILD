# Maintainer: daniel666
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: liberodark

pkgname=keeper-password-manager
pkgver=14.9.12
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('libsecret' 'nss' 'libxss' 'gtk3')
source=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb"
        'LICENSE')
sha512sums=('15de807a86daec5ac62a6bc8cf0780b1385716ffdc7310a6bacbd5395b3d922726e15b4204642f58c2342a51c5b975d1731a88a5ef0d19f179df6472b1130a87'
            '9bd161a552aba146ee89ab930b8a444442d3cb4bba8cf5e94d1a04bfe2c99fae8372d0d04d5b01fe489578429e9fd020cb567e005b1a267fcb51a0bc4cb2f7b2')
        
package() { 
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"   

  echo "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 "$pkgdir"/usr/lib/keeperpasswordmanager/chrome-sandbox
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$pkgdir"/usr/lib/keeperpasswordmanager/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/chromium/LICENSES.chromium.html
}
