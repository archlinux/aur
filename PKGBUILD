# PKGBUILD для superfetch
pkgname=superfetch
pkgver=1.0.0 # Твоя текущая версия
pkgrel=1
pkgdesc="Супер-быстрая и легковесная утилита для отображения системной информации с настраиваемым цветом."
arch=('any') 
url="https://github.com/YourGitHubUser/superfetch" # ОБНОВИ ЭТО
license=('GPL') 
depends=('bash' 'coreutils' 'grep' 'awk' 'xorg-xrandr' 'lm_sensors') # Добавляем все нужные утилиты

# Источники для makepkg. Мы используем локальные файлы
source=('superfetch' 'superfetch-config' 'https://github.com/zuterogwindows/superfetch-bash/archive/main.tar.gz') 

# Так как это локальные файлы, мы используем 'SKIP'
sha256sums=('SKIP' 'SKIP') 

build() {
  # Для Bash-скриптов ничего не нужно
  true
}

package() {
  # 1. Установка главного исполняемого файла в /usr/bin/
  install -D -m755 superfetch "${pkgdir}/usr/bin/superfetch"

  # 2. Установка конфигурационной утилиты в /usr/bin/
  install -D -m755 superfetch-config "${pkgdir}/usr/bin/superfetch-config"

  # 3. Создание директории для man-страницы (лучшая практика)
  install -d "${pkgdir}/usr/share/man/man1/"
  
  # 4. Создание директории для лицензии
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
