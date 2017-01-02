# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
 
pkgname=ardour-demosong
pkgver=1
pkgrel=1
 
pkgdesc='Demo song for Ardour'
license=('custom')
arch=('any')
url="https://www.youtube.com/watch?v=iLvjaMH7AlE"
depends=('ardour' 'calf' 'eq10q')
optdepends=('jack2: for better sound quality')
         
source=('https://www.dropbox.com/s/20zecpayz0u43ih/BBMM_Ard.tar.gz'
        'https://ptpb.pw/51pv')
md5sums=('ee15e95fe7fc1dc0c6d20407518405d7'
        '5f3362ed12391bb16c7dad08533cc85f')
 
package() {
    install -dm755 "$pkgdir""$HOME"/Ardour/BBMM
    cp -dr --no-preserve='ownership' BBMM/* "$pkgdir""$HOME"/Ardour/BBMM
    chown -R $USER "$pkgdir""$HOME"/Ardour/BBMM
       
    # license
    install -Dm644 51pv "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
