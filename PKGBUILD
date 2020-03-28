# Maintainer: daniel666
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: liberodark

pkgname=keeper-password-manager
pkgver=14.12.4
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('libsecret' 'nss' 'libxss' 'gtk3')
source=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb"
        'LICENSE')
sha512sums=('a25355994beb3bbaa25473d5fe00f00579f8582de6cd90e90fddd043213c278aa77d43475d6d72e21bbc4a48e1950fe2a47720f5d9c7b35f43d4a11db7d512ea'
            '9bd161a552aba146ee89ab930b8a444442d3cb4bba8cf5e94d1a04bfe2c99fae8372d0d04d5b01fe489578429e9fd020cb567e005b1a267fcb51a0bc4cb2f7b2')
        
package() { 
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"   

  echo "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 "$pkgdir"/usr/lib/keeperpasswordmanager/chrome-sandbox
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$pkgdir"/usr/lib/keeperpasswordmanager/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/chromium/LICENSES.chromium.html
}
