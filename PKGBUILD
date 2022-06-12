# Maintainer: WeepingDogel <weepingdogel@gmail.com>

pkgname=titlegetter
pkgver=2.2.5
pkgrel=1
pkgdesc='A little tool to get the title of the websites and format the title and the links to markdown or html.'
url='https://github.com/WeepingDogel/TitleGetter'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-requests' 'python-lxml' 'python-beautifulsoup4' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('11d2edd0cb66083885d8b4de9850f705e841a9f5fa49c7200a6901773f3df0321a564bc7272d749c02ef9abeec2b561baee48c04190bcc2ab16877907e163b7f')
package(){
    cd TitleGetter-$pkgver
    install -Dm755 "titlegetter.py" -t "$pkgdir/usr/bin"
    ln -s "titlegetter.py" "$pkgdir/usr/bin/titlegetter"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/titlegetter"
    install -Dm644 "config/version" -t "$pkgdir/etc/titlegetter"
    mv "$pkgdir/etc/titlegetter/version" "$pkgdir/etc/titlegetter/.version"
    install -Dm644 "Pics/2020-09-13_00-17.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/2020-09-13_00-28.png" -t "$pkgdir/usr/share/titlegetter/example"
    install -Dm644 "Pics/TitleGetter.png" -t "$pkgdir/usr/share/titlegetter/Pics"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/titlegetter"
}
