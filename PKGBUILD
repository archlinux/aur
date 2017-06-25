# Maintainer: Falco Preiseni <apfelkomplott2014 at mailbox dot org>
pkgname=ende
pkgver=1.0.0
pkgrel=3
pkgdesc="An english<->german dictionary for your command line"
arch=('any')
url="https://git.codecoop.org/iceflower/ende"
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant')
source=('https://git.codecoop.org/iceflower/ende/repository/ende-release-68c2270662280a20dab0c6e60cb1515b75fdf1a5.tar.bz2?ref=release'
        'http://ftp.tu-chemnitz.de/pub/Local/urz/ding/de-en/de-en.txt.zip')
sha512sums=('5a355ca49ecd2efc3a5cd05b6c61c90353271b05b8858099a30e7b6c683b9b5644713458d2452b96348d101ffd87e71ac8b4b0a97fc9a711e58b121445e9ca11'
            '3944974e3041062ca6f62d345006803e35258494aec5ffc0c28f5c7d51149780590dd720e7b99d3acb79220c88245beec745052a5affd0a9b445da834b44853b')
package() {
	cd "$srcdir/ende-release-68c2270662280a20dab0c6e60cb1515b75fdf1a5/EnDe/"
	mv ../../de-en.txt ./
	ant archlinux-install
	cp -R dist/* "$pkgdir"
	chmod a+r+x "$pkgdir/usr/bin/$pkgname"
}

