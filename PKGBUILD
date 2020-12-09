# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=streamlabels
pkgver=0.3.8
pkgrel=2
pkgdesc="Stream Labels is an application that runs on your computer that generates text files. These text files contain stats, including your top donor for the day, your most recent follower, and many others."
arch=('x86_64')
url="https://patojad.com.ar/aplicaciones/2020/12/streamlabels-en-arch-linux/"
license=('GPL')
source=("https://s3-us-west-2.amazonaws.com/streamlabs-electron/streamlabels_0.3.8_amd64.deb"
        "pjadalien.py")
md5sums=('ade077aa9baf135de156b169d8d4ecd8'
         '8b65bd2668e7b7acc0768e16841130bc')


package() {
    cd $_pkgbase
    python $srcdir/pjadalien.py $srcdir/streamlabels_0.3.8_amd64.deb
    sudo pacman -U $srcdir/streamlabels-0.3.8-1-x86_64.pkg.tar.gz
}
