
pkgname='manga-cli-notprash-git'                                                                 
_pkgname='manga-cli'                                                                             
pkgver=r43.6f90d80                                                                           
pkgrel=1                                                                                         
pkgdesc="Script to read manga from cli."                                                         
arch=('any')                                                                                     
url="https://github.com/notprash/manga-cli.git"                                                  
license=('MIT')                                                                                  
depends=('curl' 'zathura' 'zathura-cb' 'pup')                                                    
makedepends=('git')                                                                              
optdepends=('zathura-pdf-poppler: view manga file as pdf' 'imagemagick: converting files to pdf')
provides=('manga-cli-notprash-git')                                                                           
source=("git+$url")                                                                              
md5sums=('SKIP')                                                                                 
                                                                                                 
                                                                                                 
pkgver() {                                                                                       
    cd "$srcdir/${_pkgname}"                                                                     
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"           
}                                                                                                
                                                                                                 
                                                                                                 
package() {                                                                                      
    cd "$srcdir/$_pkgname"                                                                       
	install -Dm755 ./manga-cli "$pkgdir/usr/bin/manga-cli"
}
