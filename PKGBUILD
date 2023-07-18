# Maintainer: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>
# Maintainer: redtide <redtid3@gmail.com>

pkgname=xairedit
pkgver=1.8
pkgrel=1
pkgdesc="Remote control program for Behringer X-AIR mixers"
arch=(
  x86_64
  armv7h
)
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=(
  alsa-lib
  freetype2
  libcurl-gnutls
  libglvnd
  libxext
)
source=('EULA_2012-09-12.pdf'
        'xairedit.desktop')
source_x86_64=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_LINUX_$pkgver.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_RASPI_$pkgver.tar.gz")
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            '3633f4225036a4e6499d48a350d852028c955a4cf749a95a876022ff64f6d12d801814e6953c8a0c1f428d2f63a2e99ff8296130bafcd6aedfe0126160c649a4')
sha512sums_x86_64=('0d31aea580d9d044dcecb663d042a25ffa595aa5e6ef4b938346afca23265786a1c71271e93ab2553157163f77eafd4d9bffa403a024a2fc8d9b66ca8b322540')
sha512sums_armv7h=('7f2e3126b74f35e3415009312d0f7639b4ec35bf466748e81942cfb23733da2ecd58da6131d97fc75b9c042345c8cfe6aed20b91026ad7ded7c7c8bb02efbbf9')
b2sums=('f3af5fcb0044782d51ef976375b6184d781bab5110fb2184ac40443df7b21fdfc12ffa534448bb0aa41df8210c5e63a7d2995ee54279c2ec0824de5eb83aae64'
        '1c1d89adf7e57cb49c2e87de2a3c90ddeedf066b66a3b74e72ae6bac64da2bb3daa92788ec2577050e65dda70a8b4985cc4dfb23ebba74ca7ebbbc848b5d3ba5')
b2sums_x86_64=('d16fa66a5b7cd75abd621e034fc1f93e945bd2c3f7162092b6c981d389b358158800135829724c6722c0e0690872a8d24f0c344d7f008c68acf9523ab8cf3adf')
b2sums_armv7h=('aba7a73b9d7a7af092aaa003e5ed8a684bc3334ed393feb6b5bcbd3d735246d8136cd9f3d360b9e652c8287fd7003cf21b87e67fef32b6c927a19ec674b0232d')

package()
{
    cd "$srcdir"
    install -Dm755 X-AIR-Edit "$pkgdir"/usr/bin/$pkgname
    install -Dm644 EULA_2012-09-12.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
    install -Dm644 xairedit.desktop -t "$pkgdir"/usr/share/applications
    install -Dm644 X-AIR-Edit_icon.png "$pkgdir"/usr/share/pixmaps/xairedit.png
}
