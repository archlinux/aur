# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ini_file_manager
pkgver=10
pkgrel=1
pkgdesc="Ini configuration file reader and manipulator package for Ada."

arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ini-files"
license=('MIT')

depends=('gcc-ada')

source=("https://sourceforge.net/projects/ini-files/files/ini-files/ini-files-$pkgver.zip"
        'construct.gpr'
        'example.gpr'
        'ini_file_manager.gpr')

sha256sums=('8ad0e74862557d8121dd0bc6b34c037ebe60bfca4eb8d879dc25e55f27ef1175'
            'a40217c7220e421dcee198f8fd7f13633e25d7f73b6abc9e9d31259b2ecb3111'
            'a7f6906e0b84d28abae0edc4e671f31798528945caa84f1e00060bedb5abf8c5'
            '84b79de44dbf7b038da6bc76205eed8458592187b0a0cd8088a7f0bbb09e0b8f')

build() 
{
   cd "$srcdir/ini-files-code"

   gprbuild -p -P ini_files.gpr
}


package() 
{
   cd "$srcdir/ini-files-code"

   gprinstall -p -P ini_files.gpr --prefix="$pkgdir/usr"
}