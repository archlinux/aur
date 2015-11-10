# Maintainer: M0Rf30
pkgname=wolf-data
pkgver=1.41b
pkgrel=4
pkgdesc="Return to Castle Wolfenstein Single Player pk3s files (shared use)"
arch=('any')
url="ftp://ftp.internat.freebsd.org/pub/FreeBSD/distfiles/"
license=('GPL')
install='wolf-data.install'
source=("https://dl.dropboxusercontent.com/s/97qyelre9iryv37/wolf-linux-${pkgver}.x86.run")

package() {
  # Set Install Files to Executable
    cd $srcdir
    chmod +x wolf-linux-${pkgver}.x86.run
      
  # Extract Linux Game Files
    ./wolf-linux-${pkgver}.x86.run --target files --noexec
    cd files
  # Remove Unneeded Files and Directories
    cd main
    rm *.so
  
  # Move Data to Package Directory
    mkdir -p $pkgdir/opt/wolf-data
    cp -r * $pkgdir/opt/wolf-data/
}

md5sums=('2aa37968aff19d665ed6c001773b2de3')
