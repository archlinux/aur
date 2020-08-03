# Maintainer: Robert Ulmer <arch.x(at)frontexpers.com>
pkgname="filius"
pkgver="1.10.2"
_pkgver="${pkgver}"
pkgrel=1
pkgdesc="Network simulation program"
arch=('any')
url="http://www.lernsoftware-filius.de"
license=('GPL')
depends=('java-environment>=8')
source=(http://www.lernsoftware-filius.de/downloads/Setup/$pkgname-$_pkgver.zip)
sha256sums=('850aebe6522c4f4bfdf04afe2565c284acb4303c6727b176e031806c587ceff9')
package() {
	cd $srcdir
	# cp -r usr/ etc/ $pkgdir
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/filius/
  mkdir -p $pkgdir/usr/share/pixmaps/
  mkdir -p $pkgdir/usr/share/applications/

  rm Filius.exe
  rm Filius.command
  # mv lib $pkgdir/usr/lib/filius
  cp -r Changelog.txt  config  Einfuehrung_Filius.pdf  filius.jar  Filius.sh  GPLv2.txt  GPLv3.txt  hilfe  img  Introduction_Filius.pdf  lib  tmpl $pkgdir/usr/share/filius/
  chmod +x $pkgdir/usr/share/filius/Filius.sh
  ln -s /usr/share/filius/Filius.sh $pkgdir/usr/bin/filius

  base64 -d > $pkgdir/usr/share/pixmaps/filius32.png <<EOF
iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAABhmlDQ1BJQ0MgcHJvZmlsZQAAKJF9
kTtIw1AUhv8+pEUqDnZQcchQnSyIigguWoUiVAi1QqsOJjd9QZOGJMXFUXAtOPhYrDq4OOvq4CoI
gg8QJ0cnRRcp8dyk0CLGA5f78d/z/9x7LuBvVJhqBscAVbOMdDIhZHOrQugVPgwgjBkEJWbqc6KY
gmd93VM31V2cZ3n3/Vk9St5kgE8gnmW6YRFvEE9tWjrnfeIoK0kK8TnxqEEXJH7kuuzyG+eiw36e
GTUy6XniKLFQ7GC5g1nJUIkniWOKqlG+P+uywnmLs1qpsdY9+QsjeW1lmeu0hpDEIpYgQoCMGsqo
wEKcdo0UE2k6T3j4Bx2/SC6ZXGUwciygChWS4wf/g9+zNQsT425SJAF0vdj2xzAQ2gWaddv+Prbt
5gkQeAautLa/2gCmP0mvt7XYEdC7DVxctzV5D7jcAfqfdMmQHClAy18oAO9n9E05oO8W6F5z59Y6
x+kDkKFZpW6Ag0NgpEjZ6x7vDnfO7d+e1vx+AFywcp5Q21niAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH5AEZCQg5yX37HgAAABl0RVh0Q29tbWVudABDcmVh
dGVkIHdpdGggR0lNUFeBDhcAAAHzSURBVFjD7ZfBattAEIa/9Y4vPaY41OQFAoFCz73aBxX6DPWj
tfQRDD3ppkBvuQVy7CHBQaJ5AUveXkZmu11JK6PQFrJgLJifmdHMP/+OjHOO1DOfz21d1wvAdkAa
Ean2+32T6tOkJqDBr4DPwHkHrAQ2InKbmkRyAsaYN8A34Ap4AsIAFjgDboEPzrnHFL9C+rH65k/A
R2AX2JfAVjE21emYBI59BnbOuYegQkSqMnhm/OXzksApHLDAUnsektCO5YGMJF+pY7gdGMNm8haI
SAVsggDWG7lGbRvFTquEESleAF/U9AmoTpHiURxQx4/e3L9WUxXqwv89BcaYtsR9krr07LGpCAlc
OeeaQQ5o8KFbD48HtP3vwZYtgcMkZh3Bv+q/naDKv/nUGPEKBFfunWZd9rRgq8+x27E951rNy+hV
7Zw7/oAL4F6dvQOsb+/A3gMXPTirvnYx7AygKAqyLPtD9VarVbNer8myjKIoTqq/9rzs4ohExOWn
2hZ5nh/3vDzPG6AT2+4DrRD1+fWxBngbMN6XVn/Pu6vr+nJqrAFuEve8jTqcFCsj9rz5c2DF3/OA
hw4VO3UnHMS+rGT/zG1olRgpe96YnXAQKyP2vP1zYC3wHXgPvIopKfCjFZfD4XA9NdaISNInt75F
8ud56qf8L3SUS7sHJVXXAAAAAElFTkSuQmCC
EOF

cat > $pkgdir/usr/share/applications/filius.desktop << EOF
[Desktop Entry]
Name=Filius
Name[de]=Filius
Comment=Learn how Computer Networks are built
Comment[de]=Lernsoftware zu Rechnernetzen
Exec=/usr/share/filius/Filius.sh
Icon=filius32
Terminal=false
Type=Application
Categories=Education
StartupNotify=false
EOF

}


