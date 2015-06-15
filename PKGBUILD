      # Maintainer: lemust83 <lemust83420@gmail.com>
        pkgname=readesm-fr
        pkgver=2.4
        pkgrel=1
        pkgdesc="lire les fichiers Tachographs issus de Cardpeek ou autres  dans un format humainement compréhensible"
        arch=(i686 x86_64)
        url="http://readesm.sourceforge.net/help.html"
        license=('GPL')
        groups=()
        depends=('boost' 'gmp' 'libgcrypt' 'qt4' 'qtwebkit' 'python2')
        makedepends=('cmake')
        replaces=('readesm' 'readesm-fr' )
        source=(http://sourceforge.net/project/readesmfr/readesm-fr/readesm-fr.2.4.tar.gz)		
        sha256sums=(e4a016d3654646f4bb4cc5e1fc708e2208ff8efa6bcfc588d61d498165167412)

        build() {
          cd "$srcdir/readesm-fr.2.4/fileformat"
          python2 ./generate.py
          cd ..
          mkdir build
          cd build
          cmake ..
          make
         }

        package ()
       {
        cd "$srcdir/readesm-fr.2.4/build"
        make DESTDIR="$pkgdir" install
       }

