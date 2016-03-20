# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=subdomain-analyzer
pkgver=20150518
pkgrel=1
pkgdesc="Get full detailed information of selected domain"
url="https://github.com/El3ct71k/SubDomain-Analyzer"
arch=("any")
license=('GPL3')
depends=('python2'
         'python2-gevent'
         'python2-dnspython'
         'python2-prettytable')
source=("https://github.com/El3ct71k/SubDomain-Analyzer/archive/master.zip")
md5sums=("SKIP")
package() {
        sed -i 's/python/python2/' ${srcdir}/SubDomain-Analyzer-master/subdomain-analyzer.py
        sed -i 's/subdomains.txt/\/usr\/share\/subdomain-analyzer\/subdomains.txt/' ${srcdir}/SubDomain-Analyzer-master/subdomain-analyzer.py
        chmod +x ${srcdir}/SubDomain-Analyzer-master/subdomain-analyzer.py
        mkdir -p ${pkgdir}/usr/share/subdomain-analyzer
        mkdir -p ${pkgdir}/usr/bin
        cp ${srcdir}/SubDomain-Analyzer-master/* ${pkgdir}/usr/share/subdomain-analyzer
        ln -s /usr/share/subdomain-analyzer/subdomain-analyzer.py ${pkgdir}/usr/bin/subdomain-analyzer
}
