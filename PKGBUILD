pkgname=agetha
pkgver=1.0
pkgrel=5
pkgdesc="Agetha AI Desktop Companion"
arch=('any')
license=('MIT')
depends=('python' 'python-pygame' 'python-pillow' 'python-pytesseract' 'python-openai' 'tesseract-data-eng' 'tesseract-data-rus')
install=agetha.install

# Указываем ссылку на твой репозиторий
source=("git+https://github.com/GoreliSuhar1/agetha.git")
sha256sums=('SKIP')

package() {
    # Создаем директории
    install -d "$pkgdir/opt/agetha"
    install -d "$pkgdir/usr/bin"
    
    # Копируем всё из скачанного репозитория (папка agetha в srcdir)
    cp -r "$srcdir/agetha"/* "$pkgdir/opt/agetha/"
    
    # Создаем скрипт-запускатор
    echo -e '#!/bin/sh\npython3 /opt/agetha/main.py "$@"' > "$pkgdir/usr/bin/agetha"
    chmod +x "$pkgdir/usr/bin/agetha"
}
